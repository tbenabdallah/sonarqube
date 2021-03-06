/*
 * SonarQube
 * Copyright (C) 2009-2018 SonarSource SA
 * mailto:info AT sonarsource DOT com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
import * as React from 'react';
import fetch from 'isomorphic-fetch';
import ChevronDownIcon from './icons/ChevronDownIcon';
import ChevronUpIcon from './icons/ChevronUpIcon';
import OutsideClickHandler from './OutsideClickHandler';

export default class VersionSelect extends React.PureComponent {
  state = { open: false };

  handleClick = () => {
    this.setState(state => ({ open: !state.open }));
  };

  handleClickOutside = () => {
    this.setState({ open: false });
  };

  render() {
    const { versions } = this.props;
    const hasVersions = versions.length > 1;
    const currentVersion = versions.find(v => v.current);
    const versionLabel =
      this.props.version === 'latest' && currentVersion ? currentVersion.value : this.props.version;
    const isOnCurrentVersion =
      !hasVersions || (currentVersion && versionLabel === currentVersion.value);

    return (
      <div className="version-select">
        <button onClick={this.handleClick} type="button">
          Docs <span className={isOnCurrentVersion ? 'current' : ''}>{versionLabel}</span>
          {hasVersions && !this.state.open && <ChevronDownIcon size={10} />}
          {hasVersions && this.state.open && <ChevronUpIcon size={10} />}
        </button>
        {this.state.open &&
          hasVersions && (
            <OutsideClickHandler onClickOutside={this.handleClickOutside}>
              <ul>
                {versions.map(version => {
                  return (
                    <li key={version.value}>
                      <a href={version.current ? '/' : '/' + version.value}>
                        <span className={version.current ? 'current' : ''}>{version.value}</span>
                      </a>
                    </li>
                  );
                })}
              </ul>
            </OutsideClickHandler>
          )}
      </div>
    );
  }
}
